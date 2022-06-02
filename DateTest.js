try {
    const now = Date.now();
    const dateTime = new Date("2022-06-02 06:53:48");
    console.log(dateTime);

    console.log(dateTime.getTime() == dateTime.getTime());
} catch (err) {
    console.log(err);
}
