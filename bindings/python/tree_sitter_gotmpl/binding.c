#include <Python.h>

typedef struct TSLanguage TSLanguage;

TSLanguage *tree_sitter_gotmpl(void);
TSLanguage *tree_sitter_goyamltmpl(void);

static PyObject* _binding_language_gotmpl(PyObject *Py_UNUSED(self), PyObject *Py_UNUSED(args)) {
    return PyCapsule_New(tree_sitter_gotmpl(), "tree_sitter.Language", NULL);
}

static PyObject* _binding_language_goyamltmpl(PyObject *Py_UNUSED(self), PyObject *Py_UNUSED(args)) {
    return PyCapsule_New(tree_sitter_goyamltmpl(), "tree_sitter.Language", NULL);
}

static PyMethodDef methods[] = {
    {"language_gotmpl", _binding_language_gotmpl, METH_NOARGS,
     "Get the tree-sitter language for Go Template grammar."},
    {"language_goyamltmpl", _binding_language_goyamltmpl, METH_NOARGS,
     "Get the tree-sitter language for Go YAML Template grammar."},
    {NULL, NULL, 0, NULL}
};

static struct PyModuleDef module = {
    .m_base = PyModuleDef_HEAD_INIT,
    .m_name = "_binding",
    .m_doc = NULL,
    .m_size = -1,
    .m_methods = methods
};

PyMODINIT_FUNC PyInit__binding(void) {
    return PyModule_Create(&module);
}
