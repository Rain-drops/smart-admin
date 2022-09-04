export default {
  name: 'RenderDom',
  functional: true,
  props: {
    render: Function,
    renderHeader: Function
  },
  render: (h, ctx) => {
    return ctx.props.render(h);
  },
  renderHeader: (h, ctx) => {
    return ctx.props.renderHeader(h);
  }
};
