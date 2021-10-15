import metrics from './metrics';
import colors from './colors';

const global = {
  container: {
    paddingHorizontal: metrics.padding,
    backgroundColor: colors.background
  },

  text: {
      color: colors.text
  },

  icon: {
    fontSize: 24,
    color: colors.text
  }
};

export default global;