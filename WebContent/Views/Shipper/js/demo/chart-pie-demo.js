Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';
var ctx = document.getElementById("myPieChart");

		alert(pie1); 	
var myPieChart = new Chart(ctx, {
	type: 'doughnut',
	data: {
		labels: ["Shirt", "Dress", "Pants", "Accessory"],
		datasets: [{
			data: [pie1, 30, 10, 5],
			backgroundColor: ['#d9534f', '#0275d8', '#5cb85c', '#686f73'],
			hoverBackgroundColor: ['#c24946', '#0059a6', '#4d994d', '#313436'],
			hoverBorderColor: "rgba(234, 236, 244, 1)",
		}],
	},
	options: {
		maintainAspectRatio: false,
		tooltips: {
			backgroundColor: "rgb(255,255,255)",
			bodyFontColor: "#858796",
			borderColor: '#dddfeb',
			borderWidth: 1,
			xPadding: 15,
			yPadding: 15,
			displayColors: false,
			caretPadding: 10,
		},
		legend: {
			display: false
		},
		cutoutPercentage: 80,
	},
});