fn main() {
    let root_dir = std::path::Path::new(".");
    let gotmpl_dir = root_dir.join("gotmpl").join("src");
    let goyamltmpl_dir = root_dir.join("goyamltmpl").join("src");

    let mut config = cc::Build::new();
    config.include(&gotmpl_dir);
    config.flag_if_supported("-std=c11").flag_if_supported("-Wno-unused-parameter");

    for path in &[gotmpl_dir.join("parser.c"), goyamltmpl_dir.join("parser.c")] {
        config.file(path);
        println!("cargo:rerun-if-changed={}", path.to_str().unwrap());
    }

    config.compile("tree-sitter-typescript");
}
