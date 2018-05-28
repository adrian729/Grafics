#include "animateVertices.h"
#include "glwidget.h"

void AnimateVertices::onPluginLoad()
{
	glwidget()->makeCurrent();
	vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
	vs->compileSourceFile("animate-vertices-1.vert");
	fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
	fs->compileSourceFile("animate-vertices-1.frag");
	program = new QOpenGLShaderProgram(this);
	program->addShader(vs);
	program->addShader(fs);
	program->link();
	elapsedTimer.start();
}

void AnimateVertices::preFrame()
{
	program->bind();
	program->setUniformValue("time", elapsedTimer.elapsed()/1000.0f);
	QMatrix3x3 N = camera()->viewMatrix().normalMatrix();
	program->setUniformValue("normalMatrix", N);
	QMatrix4x4 MVP = camera()->projectionMatrix()*camera()->viewMatrix();
	program->setUniformValue("modelViewProjectionMatrix", MVP);
}

void AnimateVertices::postFrame()
{
	program->release();
}
