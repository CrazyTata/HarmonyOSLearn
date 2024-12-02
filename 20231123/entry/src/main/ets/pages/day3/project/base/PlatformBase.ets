export class PlatformBase {
	code?: number = 0;
	title?: string = "";
	subtitle?: string = "";
	update_time?: string = "";
	data?: PlatformBaseData[] = [];
}
export class PlatformBaseData {
	index?: number = 0;
	title?: string = "";
	pic?: string = "";
	desc?: string = "";
	hot?: string = "";
	url?: string = "";
	mobilUrl?: string = "";
}