#ifndef _MODELINFO2_H
#define _MODELINFO2_H

#include "plugin.h" 

class ModelInfo2: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad();
	 void onSceneClear();
	 void postFrame();

	 void onObjectAdd();
	 bool drawScene();
	 bool drawObject(int);

	 bool paintGL();

  private:
    GLuint textureID;
	QOpenGLShaderProgram* program;
    QOpenGLShader *vs, *fs;
	int nObjs, pols, verts, trgs;
	float perc;
	void updateModelInfo();
	void drawRect(GLWidget &g);
};

#endif
