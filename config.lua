Config = {}

Config.DefaultArmour = 100
Config.AllowedGroups = {"admin", "superadmin"}
Config.CommandName = "givearmour"

Config.Messages = {
    NoPermission = "You do not have permission to use this command.",
    ArmourGivenSelf = "You have been given armour.",
    ArmourGivenOther = "You have given armour to %s (ID: %d).",
    ArmourReceived = "You have been given armour by %s (ID: %d)."
}
