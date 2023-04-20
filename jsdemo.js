	// 0. 测试，node NAME.js运行该demo
	console.log("aa");

	// 1. 手写Promise
	// Promise使用：参数为一个 func(resolve, reject)函数，resolve和reject分别为执行成功和执行失败的函数
	var promise = new Promise(function(resolve, reject) {
			if () {
				resolve();
			} else {
				reject();
			}
		})
		//通过then设置之后的两个操作
		.then(function() {
			//回调执行成功的操作
		}, function() {
			//回调执行失败的操作
		})
		
		//	2. 节流（每个时间段只执行一次回调函数）
		function throttle(interval,fn){
			let lastTime = 0; //上次触发回调的时间
			return (params) => {
				let now = +new Date(); //记录本次回调触发的时间
				if(now - lastTime >= interval){ //判断上次触发的时间和本次触发的时间差是否小于时间间隔的阈值，若不小于，则执行回调
					lastTime = now;
					fn(params);
				}
			}
		}
		//参数为节流时间，事件函数
		const throttle_scroll = throttle(1000, () => console.log('页面滚动'));
		throttle_scroll();
		// document.addEventListener('scroll', throttle_scroll)//绑定事件
		
		
		// 3.防抖（每次事件发生会等待一定的时间才允许下一次发生）
		function debounce(time,fn){
		 let timer = null
		 return (params) => {
			 //每次事件被触发时，都去清除之前的旧定时器
			 if(timer) clearTimeout(timer)
			 timer = setTimeout(() => fn(params), time) // 设置新的定时器
		 }
		}
		// 参数为防抖时间和事件函数
		const debounce_scroll = debounce(1000, () => console.log('页面滚动'));
		debounce_scroll();
		// document.addEventListener('scroll', debounce_scroll)

    // 设置防抖函数
    function throttle(fn, delay) {
      let timer = null;
      return () => {
        if(timer) {return;};
        timer = setTimeout(() => {
          fn(imgs);
          timer = null;
        }, delay)
      }
    }
    // 监听滚动事件，加载后面的图片；
    window.onscroll = throttle(lazyLoad, 500);