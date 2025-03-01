#include <napi.h>

typedef struct TSLanguage TSLanguage;

extern "C" TSLanguage *tree_sitter_gotmpl();
extern "C" TSLanguage *tree_sitter_helm();

// "tree-sitter", "language" hashed with BLAKE2
const napi_type_tag LANGUAGE_TYPE_TAG = {
    0x8AF2E5212AD58ABF, 0xD5006CAD83ABBA16
};

Napi::Object Init(Napi::Env env, Napi::Object exports) {
    auto gotmpl = Napi::Object::New(env);
    gotmpl["name"] = Napi::String::New(env, "gotmpl");
    auto gotmpl_language = Napi::External<TSLanguage>::New(env, tree_sitter_gotmpl());
    gotmpl_language.TypeTag(&LANGUAGE_TYPE_TAG);
    gotmpl["language"] = gotmpl_language;

    auto helm = Napi::Object::New(env);
    helm["name"] = Napi::String::New(env, "helm");
    auto helm_language = Napi::External<TSLanguage>::New(env, tree_sitter_helm());
    helm_language.TypeTag(&LANGUAGE_TYPE_TAG);
    helm["language"] = helm_language;

    exports["gotmpl"] = gotmpl;
    exports["helm"] = helm;

    return exports;
}

NODE_API_MODULE(tree_sitter_gotmpl_binding, Init)
