#include "modelInfo2.h"
#include "glwidget.h"
#include <QPainter>

void ModelInfo2::onPluginLoad() {
	// Carregar shader, compile & link 
    vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    vs->compileSourceFile("show.vert");

    fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    fs->compileSourceFile("show.frag");

    program = new QOpenGLShaderProgram(this);
    program->addShader(vs);
    program->addShader(fs);
    program->link();
	updateModelInfo();
}

void ModelInfo2::onSceneClear() {
	updateModelInfo();
}

void ModelInfo2::postFrame() {
	GLWidget &g=*glwidget();
 	g.makeCurrent();
    const int SIZE = 1024;
    // 1. Create image with text
    QImage image(SIZE,SIZE,QImage::Format_RGB32);
    image.fill(Qt::white);    
    QPainter painter;
    painter.begin(&image);
    QFont font;
    font.setPixelSize(32);
    painter.setFont(font);
    painter.setPen(QColor(50,50,50));
    int x = 15;
    int y = 100;
    painter.drawText(x, y, QString(("Num objects: " + to_string(nObjs)).c_str()));
	y += 40;
    painter.drawText(x, y, QString(("Num poligons: " + to_string(pols)).c_str()));
	y += 40;
    painter.drawText(x, y, QString(("Num vertex: " + to_string(verts)).c_str()));
	y += 40;
    painter.drawText(x, y, QString(("Perc triangles: " + to_string(perc) + "%").c_str()));
    painter.end();
    // 2. Create texture
    const int textureUnit = 5;
    g.glActiveTexture(GL_TEXTURE0+textureUnit);
    QImage im0 = image.mirrored(false, true).convertToFormat(QImage::Format_RGBA8888, Qt::ColorOnly);
	g.glGenTextures( 1, &textureID);
	g.glBindTexture(GL_TEXTURE_2D, textureID);
	g.glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, im0.width(), im0.height(), 0, GL_RGBA, GL_UNSIGNED_BYTE, im0.bits());
	g.glGenerateMipmap(GL_TEXTURE_2D);
	glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR );
	g.glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
	g.glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT );
	g.glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT );	
    // Pass 2. Draw quad using texture
    program->bind();
    program->setUniformValue("colorMap", textureUnit);
    program->setUniformValue("WIDTH", float(glwidget()->width()));
    program->setUniformValue("HEIGHT", float(glwidget()->height())); 
    // quad covering viewport 
    drawRect(g);
    program->release();
    g.glBindTexture(GL_TEXTURE_2D, 0);    
    g.glDeleteTextures(1, &textureID);
}

void ModelInfo2::onObjectAdd() {
	updateModelInfo();
}

bool ModelInfo2::drawScene() {
	return false; // return true only if implemented
}

bool ModelInfo2::drawObject(int) {
	return false; // return true only if implemented
}

bool ModelInfo2::paintGL() {
	return false; // return true only if implemented
}

void ModelInfo2::updateModelInfo() {
	vector<Object> objs = scene()->objects();
	nObjs = objs.size();
	pols = verts = trgs = 0;	
	for(int i = 0; i < nObjs; ++i) {
		vector<Face> faces = objs[i].faces();
		pols += faces.size();
		verts += objs[i].vertices().size();
		for (int j = 0; j < faces.size(); ++j) {
			if(faces[j].numVertices() == 3) ++(trgs);
		}
	}
	perc = (pols != 0 ? 
		(float(trgs)/float(pols))*100 : 100);
}

void ModelInfo2::drawRect(GLWidget &g)
{
    static bool created = false;
    static GLuint VAO_rect;

    // 1. Create VBO Buffers
    if (!created)
    {
        created = true;
        
        // Create & bind empty VAO
        g.glGenVertexArrays(1, &VAO_rect);
        g.glBindVertexArray(VAO_rect);

        float z = -0.99999;
        // Create VBO with (x,y,z) coordinates
        float coords[] = { -1, -1, z, 
                            1, -1, z, 
                           -1,  1, z, 
                            1,  1, z};

        GLuint VBO_coords;
        g.glGenBuffers(1, &VBO_coords);
        g.glBindBuffer(GL_ARRAY_BUFFER, VBO_coords);
        g.glBufferData(GL_ARRAY_BUFFER, sizeof(coords), coords, GL_STATIC_DRAW);
        g.glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, 0);
        g.glEnableVertexAttribArray(0);
        g.glBindVertexArray(0);
    }

    // 2. Draw
    g.glBindVertexArray (VAO_rect);
    g.glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    g.glBindVertexArray(0);
}
