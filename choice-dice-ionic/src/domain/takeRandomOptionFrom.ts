function takeRandomOptionFrom(options: string[]): string {
    const index = Math.floor(Math.random() * options.length);
    return options[index];
}

export default takeRandomOptionFrom;