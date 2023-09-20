// Simple load remover for TASOMACHI: Behind the Twilight (for 28th april 2022 update on Steam)

state("tasomachi-Win64-Shipping")
{
	bool isLoading : "tasomachi-Win64-Shipping.exe", 0x3BA0AD4;
}

isLoading
{
	return current.isLoading;
}