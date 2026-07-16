#pragma semicolon 1

#include <sourcemod>
//#include <colors>
#define	TAG_INFO "\x03\x01"
 
public Plugin:myinfo =
{
	name = "Player Joined Notifier",
	author = "billy",
	description = "Notifies when a new player has joined the game.",
	version = "1.0"
};

public OnClientPutInServer(client) {
	if (IsFakeClient(client)) // a bot
	  return;
	for (new i = 1; i <= MaxClients; i++) {
		if (IsClientInGame(i)) {
			if (!IsFakeClient(i)) {
				if (i != client) {
			   //CPrintToChat(i, "{green}%s \x04%N\x01 Joined The Game.", TAG_INFO, client);
			   PrintToChat(i, "\x04%N\x01 Joined The Game.", client);
				}
			}
		}
	}
}