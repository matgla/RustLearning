#![no_std]
#![no_main]

use panic_halt as _;

extern "C" {
    fn print(x: *const u8);
}

#[no_mangle]
pub unsafe extern "C" fn start() -> ! {
    unsafe {
        print("Hello World, I am rust module!\n".as_ptr());
    }

    loop {}
}
