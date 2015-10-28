var NewLinkForm = React.createClass({
  getInitialState:function() {
    return {

    };
  },

  render: function() {
    return (
      <div>
        <ValidatedInput inputTitle='Link' placeholder="Your link here"
          errorMessage='Link cannot be blank' minChars='8' />
      </div>
    );
  }
});
