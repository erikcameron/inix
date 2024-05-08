use std::ffi::{CString};
use nix::unistd::{execv};

fn main() {
    let path = CString::new("/bin/ls").unwrap();
    let argv = [CString::new("-l").unwrap()];
    execv(&path, &argv).unwrap();
}
