mod game;
mod rapier_world;
mod utils;

// use gdnative::{godot_print, prelude::{godot_init, InitHandle}};
use gdnative::{godot_print, prelude::*};

// Function that registers all exposed classes to Godot
fn init(handle: InitHandle) {
    godot_print!("lib.rs: rust gdnative init");
    handle.add_class::<game::Game>();
    handle.add_class::<rapier_world::RapierWorld2D>();
}

fn shutdown(info: &gdnative::TerminateInfo) {
    godot_print!("shutdown: (in_editor: {})", info.in_editor());
}

// macros that create the entry-points of the dynamic library.
// godot_native!(init);
godot_gdnative_init!();
godot_nativescript_init!(init);
godot_gdnative_terminate!(shutdown);