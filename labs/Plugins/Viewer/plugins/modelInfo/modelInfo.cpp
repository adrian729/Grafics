#include "modelInfo.h"
#include "glwidget.h"

void ModelInfo::onPluginLoad()
{
	updateModelInfo();
}

void ModelInfo::postFrame()
{
	cout << "Num objects: " << nObjs << endl;
	cout << "Num poligons: " << pols << endl;
	cout << "Num vertex: " << verts << endl;
	cout << "Perc triangles: : " << perc << "%" << endl;
}

void ModelInfo::onObjectAdd()
{
	updateModelInfo();
}

void ModelInfo::onSceneClear()
{
	updateModelInfo();
}

void ModelInfo::updateModelInfo() {
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
