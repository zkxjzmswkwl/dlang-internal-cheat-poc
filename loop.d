import core.thread;

import game;
import cheats;
import core.sys.windows.windows;

class Loop : Thread {
	Cheats cheats = new Cheats();

	public this()
	{
		super( &run );
	}


	void run()
	{
		for ( ;; )
		{

			if ( GetAsyncKeyState( 0x5 ) & 1 )
				cheats.telekill();

			if ( GetAsyncKeyState( 0x6 ) & 1 )
				cheats.setHealth();

			Thread.sleep( dur!("msecs")( 10 ) );
		}
	}
}
