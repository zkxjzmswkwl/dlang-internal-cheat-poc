import game;
import core.sys.windows.windows;

class Cheats 
{
private:
	Position savedPosition;
	int*     playerCount;
	Entity*  localPlayer;
	DWORD*   entityList;

	void writeX(Entity* player, float newX)
	{
		player.x = newX;
	}

	void writeY(Entity* player, float newY)
	{
		player.y = newY;
	}

	void writeZ(Entity* player, float newZ)
	{
		player.z = newZ;
	}
public:
	/// Teleports to each enemy until they die. Swaps to next player afterward.
	void telekill()
	{
		write_chat( "Telekill" );
		playerCount = getPlayerCount();
		entityList  = cast(DWORD*)0x10F4F8;
		localPlayer = *cast(Entity**)0x10F4F4;

		for (int i = 0; i < *playerCount; i++)
		{
			Entity* curPlayer = *cast(Entity**)(*entityList + 4 * i);

			if ( isEntity( curPlayer ) ) 
			{
				while ( curPlayer.health > 0 )
				{
					writeX(localPlayer, curPlayer.x);
					writeY(localPlayer, curPlayer.y);
					writeZ(localPlayer, curPlayer.z);

					// ICE button in case u gotta keep ur head down
					if ( GetAsyncKeyState(VK_NUMPAD1) )
						break;
				}
			}
		}
	}

	/// It sets your ammo to 500. Nice
	void setAmmo()
	{
		localPlayer = *cast(Entity**)0x10F4F4;

		localPlayer.assaultrifle = 500;
		localPlayer.shotgun		 = 500;
		localPlayer.machinegun	 = 500;
		localPlayer.sniper		 = 500;
		localPlayer.carbine		 = 500;
		localPlayer.pistol		 = 500;

		write_chat( "Ammo set to 500." );
	}

	/// It sets your health to 500. Epic
	void setHealth()
	{
		localPlayer = *cast(Entity**)0x10F4F4;
		localPlayer.health = 500;

		write_chat( "Health set to 500." );
	}

}
