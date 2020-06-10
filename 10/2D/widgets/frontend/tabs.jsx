import React from "react";

export default class Tabs extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      selectedPane: 0
    };
    this.selectTab = this.selectTab.bind(this); 
  }

  selectTab(num) {
    this.setState({selectedPane: num});
  }

  render() {
    const pane = this.props.panes[this.state.selectedPane];

    return (
      <div>
        <h1>Tabs</h1>
        <div className="tabs">
          <p>{this.state.selectedPane + 1}</p>
        </div>
        <div className="tab-content">
          <article>
            {pane.content}
          </article>
        </div>
      </div>
    )
  }
}