function loadDataForBar() {
    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                crossStyle: {
                    color: '#999'
                }
            }
        },
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                // magicType: {show: true, type: ['line', 'bar']},
                // restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        grid: {
            top: '15%',
            left: '15%',
            right: '5%',
            bottom: '25%'
        },
        legend: {
            data: ['总记录数', '已上报']
        },
        xAxis: {
            type: 'category',
            axisLabel: {
                interval: 0,
                rotate: 40
            },
            data: []
        },
        yAxis: {
            name: '数据条数',
            type: 'value',
            show: true,
            axisLine: {
                show: true
            }
        },
        series: [

            {
                name: '总记录数',
                data: [],
                type: 'bar',
                showBackground: true,
                backgroundStyle: {
                    color: '#4DCC33'
                }
            },
            {
                name: '已上报',
                data: [],
                type: 'bar',
                showBackground: true,
                backgroundStyle: {
                    color: '#4DCC33'
                },

            }]
    };
    var myBar = echarts.init(document.getElementById('bar'));
    myBar.setOption(option)
    $.get('personalPanelData/getBarData.do').done(function (data) {
        // 填入数据
        myBar.setOption({
            xAxis: {
                data: ['个人基本', '个人证件', '家族关系', '个人授信', '个人担保', '个人借贷']
            },
            series: [
                {
                    type: 'bar',
                    data: data.seriesTotalData
                },
                {
                    type: 'bar',
                    data: data.seriesReportedData
                }
            ]
        });
    });
}

//加载柱状图数据
loadDataForBar()

function loadDataForLine() {
    //折线图
    var myChart = echarts.init(document.getElementById('chart'));
    option = {
        backgroundColor: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
            offset: 0,
            color: '#c86589'
        },
            {
                offset: 1,
                color: '#06a7ff'
            }
        ], false),
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                lineStyle: {
                    color: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [{
                            offset: 0,
                            color: 'rgba(0, 255, 233,0)'
                        }, {
                            offset: 0.5,
                            color: 'rgba(255, 255, 255,1)',
                        }, {
                            offset: 1,
                            color: 'rgba(0, 255, 233,0)'
                        }],
                        global: false
                    }
                },
            },
        },
        grid: {
            top: '15%',
            left: '10%',
            right: '5%',
            bottom: '18my%',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            axisTick: {
                show: true
            },
            axisLine: {
                show: true
            },
            splitArea: {
                // show: true,
                color: '#f00',
                lineStyle: {
                    color: '#f00'
                },
            },
            axisLabel: {
                color: '#fff',
                interval: 0,
                rotate: 40
            },
            splitLine: {
                show: false
            },
            boundaryGap: false,
            data: [],

        }],

        yAxis: [{
            name: '入库率%',
            type: 'value',
            min: 0,
            max: 100,
            splitNumber: 4,
            splitLine: {
                show: true,
                lineStyle: {
                    color: 'rgba(255,255,255,0.1)'
                }
            },
            axisLine: {
                show: true,
            },
            axisLabel: {
                show: true,
                interval: 'auto',
                formatter: '{value}%',
                margin: 20
            },
            axisTick: {
                show: true,
            },
        }],
        series: [{
            name: '入库率',
            type: 'line',
            // smooth: true, //是否平滑
            showAllSymbol: true,
            symbol: 'circle',
            symbolSize: 15,
            lineStyle: {
                color: "#6c50f3",
                shadowColor: 'rgba(0, 0, 0, .3)',
                shadowBlur: 0,
                shadowOffsetY: 5,
                shadowOffsetX: 5,
            },
            label: {
                show: true,
                position: 'top',
                textStyle: {
                    color: '#6c50f3',
                }
            },
            itemStyle: {
                color: "#6c50f3",
                borderColor: "#fff",
                borderWidth: 3,
                shadowColor: 'rgba(0, 0, 0, .3)',
                shadowBlur: 0,
                shadowOffsetY: 2,
                shadowOffsetX: 2,
            },
            tooltip: {
                show: false
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color: 'rgba(108,80,243,0.3)'
                    },
                        {
                            offset: 1,
                            color: 'rgba(108,80,243,0)'
                        }
                    ], false),
                    shadowColor: 'rgba(108,80,243, 0.9)',
                    shadowBlur: 20
                }
            },
            data: []
        }
        ]
    };
    myChart.setOption(option);

    $.get('personalPanelData/getLineChartData.do').done(function (data) {
        // 填入数据
        myChart.setOption({
            xAxis: {
                data: data.t
            },
            series: [{
                data: data.l
            }]
        });
    });
};
//加载折线图数据
loadDataForLine()

//加载首页底部数据统计
layui.use(['carousel', 'form', 'laydate', 'table'], function () {
    var carousel = layui.carousel
        , form = layui.form
        , laydate = layui.laydate
        , table = layui.table;

    //图片轮播
    carousel.render({
        elem: '#test1'
        , width: '100%'
        , height: '100%'
        , interval: 5000
    });

    carousel.render({
        elem: '#fast'
        , width: '100%'
        , height: '100%'
    });

    carousel.render({
        elem: '#daiban'
        , width: '100%'
        , height: '100%'
    });

    //初始赋值
    laydate.render({
        elem: '#test19'
        , value: '2020-10-14'
        , isInitValue: true
    });

    //展示已知数据
    table.render({
        elem: '#demo'
        , cols: [[ //标题栏
            {field: 'EXTRACTION_DATE', title: '提取日期', width: '11%', sort: true}
            , {field: 'TOTAL_COUNT', title: '总记录数', width: '15%'}
            , {field: 'CHECK_ERROR_COUNT', title: '校验出错记录数', width: '15%'}
            , {field: 'AWAIT_GENERATE_COUNT', title: '待生成报文记录数', width: '15%'}
            , {field: 'AWAIT_REPORT_COUNT', title: '待报送记录数', width: '15%'}
            , {field: 'AWAIT_FEEDBACK_COUNT', title: '待反馈记录数', width: '15%'}
            , {field: 'FEEDBACK_ERROE_PENDING', title: '反馈错误待处理数', width: '15%', sort: true}
        ]]
        , url: 'personalPanelData/getReportStatistics.do'
        // ,request: {
        //     pageName: 'currentPage' //页码的参数名称，默认：page
        //     ,limitName: 'showCount' //每页数据量的参数名，默认：limit
        // }
        , parseData: function (res) { //res 即为原始返回的数据
            return {
                "code": res.code, //解析接口状态
                "msg": res.msg, //解析提示文本
                "count": res.total, //解析数据长度
                "data": res.data    //解析数据列表
            };
        }
        //,skin: 'line' //表格风格
        , even: true    //开启隔行背景
        , page: true //是否显示分页
        , limits: [3, 5, 7, 10]
        //,limit: 5 //每页默认显示的数量
    });

});

//加载首页顶部跳转按钮数据
$.ajax({
    url: 'personalPanelData/getPacketToDoCount.do',
    data: '',
    statusCode: {
        404: function () {
            alert("跳转按钮数据加载异常");
        }
    },
    success: function (data, textStatus, jqXHR) {
        $("#normalToGen").text(data.NORMALTOGEN);
        $("#normalToRep").text(data.NORMALTOREP);
        $("#normalToFeed").text(data.NORMALTOFEED);
        $("#abnormalToGen").text(data.ABNORMALTOGEN);
        $("#abnormalToRep").text(data.ABNORMALTOREP);
        $("#abnormalToFeed").text(data.ABNORMALTOFEED);
    }
})

//跳转按钮跳转方法
//穆楠
function normalToGen() {
    window.top.siMenu('z_78', 'lm_78', '个人正常报文生成', 'indvNormalMessage/indvNormalMessagePage.do');
}

function specialToGen() {
    window.top.siMenu('z_78', 'lm_78', '企业正常报文生成', 'entNormalMessage/entNormalMessagePage.do');
}

function normalToRep() {
    window.top.siMenu('z_243', 'lm_243', '个人正常报文下载', 'indvMessageDownLoad/indvDataPage.do');
}

function specialToRep() {
    window.top.siMenu('z_78', 'lm_78', '企业正常报文下载', 'indvMessageDownLoad/entDataPage.do');
}

/*function normalToFeed() {
    window.top.siMenu('z_78', 'lm_78', '个人正常报文待反馈', 'feedbackMessage/dataPage.do');
}

function specialToFeed() {
    window.top.siMenu('z_78', 'lm_78', '个人特殊报文待反馈', 'feedbackMessage/dataPage.do');
}*/
