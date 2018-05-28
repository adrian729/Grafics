#ifndef _SHOWDEGREE_H
#define _SHOWDEGREE_H

#include "plugin.h" 

class ShowDegree: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad() Q_DECL_OVERRIDE;
	 void postFrame() Q_DECL_OVERRIDE;

	 void onObjectAdd();

  private:
    GLuint textureID;
    QOpenGLShaderProgram* program;
    QOpenGLShader* vs;
    QOpenGLShader* fs;
	float vDegree;
	void updateDegree();
};

#endif
