import { lightTheme, darkTheme } from "./colors"
import fonts from "./fonts"
import metrics from "./metrics"

export default function getTheme(dark) {
    return {
        ...dark ? darkTheme : lightTheme,
        fonts: fonts,
        metrics: metrics
    }
}