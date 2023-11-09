import { Command } from "commander";
import * as packageInfo from "../package.json"; // Adjust the path accordingly

process.on("SIGINT", () => process.exit(0));
process.on("SIGTERM", () => process.exit(0));

function initCli() {
	const program = new Command()
		.name("wp-svelte")
		.version(
			packageInfo.version || "0.0.1",
			"-v, --version",
			"display the version number"
		);

	program.addCommand(
		new Command("test").description("Run tests").action(() => {
			console.log("Running tests");
		})
	);

	program.parse();
}

initCli();
