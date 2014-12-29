var FilteredList = React.createClass({
	filterList: function (event) {
		var updatedList = this.state.initialItems;
		updatedList = updatedList.filter( function (item) {
			return item.name.toLowerCase().search(
				event.target.value.toLowerCase()) !== -1;
		});
		this.setState({ items: updatedList });
	},

	getInitialState: function () {
		return{
			initialItems: this.props.data,
			items: []
		}
	},

	componentWillMount: function () {
		this.setState({ items: this.state.initialItems })
	},

	render: function () {
		return(
			<div className="filter-list">
			<input type="text" placeholder="Search" onChange={this.filterList}/>
			<List items={this.state.items}/>
			</div>
		);
	}
});


var CurrentItemChildren = React.createClass({
render: function() {
	return (
		<ul>
			{
				this.props.children.map(function(child){
					return <li>{ child.name }</li>
					})
			}
    </ul>
	);
}
});


var CurrentItem = React.createClass({
	render: function() {
		var item = this.props.item;
		var children = item.children
		return (
			<div>
				<li key={item.name}><a href={item.link}><span style={{color: 'red'}}> {item.name} </span></a></li>
				<CurrentItemChildren children={children}/>
			</div>
		);
	}
});

var Item = React.createClass({
	render: function() {
		var item = this.props.item;
		return (
		  <li key={item.name}><a href={item.link}> {item.name} </a></li>
		);
	}
});

var List = React.createClass({
	render: function () {
		return (
			<ul>
			{
				this.props.items.map(function(item) {
					if(item.current){
						return <CurrentItem item={item}/>
					}else{
						return <Item item={item}/>
					} 
				})
			}
			</ul>
		)
	} 
});

var ITEMS = [
	{name: "Apples"    , link: "www.google.com", current: true,
		children: [{name: "Little Aple", link:"www.google.com"}, 
			         {name: "Little Aple", link:"www.google.com"}]} ,
				{name: "ApplesNho" , link: "www.google.com"} ,
				{name: "Broccoli"  , link: "www.google.com"} ,
				{name: "Broccoli2" , link: "www.google.com"} ,
				{name: "Broccoli3" , link: "www.google.com"} ,
				{name: "Broccoli4" , link: "www.google.com"} ,
				{name: "Duck"      , link: "www.google.com"}
			]

var test_data = { ola: 'adeus' }

React.render(<FilteredList data={ ITEMS } />, document.getElementById('content'));
