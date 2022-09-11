import Main from '@/components/main';
// t_peony路由
export const peony = [
  {
    path  : '/peony',
    name: 'Peony',
    component: Main,
    meta: {
      title: '四川交投',
      icon: 'icon iconfont iconyoujianguanli'
    },
    children: [
      {
        path: '/peony/station_list',
        name: 'StationList',
        meta: {
          title: '站点状态',
          privilege: [
            { title: '查询', name: 'peony-list-query' },
            { title: '批量导出', name: 'peony-list-batch-export' },
            { title: '导出全部', name: 'peony-list-export-all' }
          ]
        },
        component: () => import('@/views/business/peony/station_list.vue')
      },
      {
        path: '/peony/car_number_in_out_list',
        name: 'CarNumberInOutList',
        meta: {
          title: '车牌出入站频次',
          privilege: [
            { title: '查询', name: 'peony-list-query' },
            { title: '批量导出', name: 'peony-list-batch-export' },
            { title: '导出全部', name: 'peony-list-export-all' }
          ]
        },
        component: () => import('@/views/business/peony/car_number_in_out_list.vue')
      },
      {
        path: '/peony/order_list',
        name: 'OrderList',
        meta: {
          title: '车辆明细查询',
          privilege: [
            { title: '查询', name: 'peony-list-query' },
            { title: '批量导出', name: 'peony-list-batch-export' },
            { title: '导出全部', name: 'peony-list-export-all' }
          ]
        },
        component: () => import('@/views/business/peony/order_list.vue')
      },
      {
        path: '/peony/car_number_match_track',
        name: 'CarNumberMatchTrackList',
        meta: {
          title: '车辆识别情况跟踪',
          privilege: [
            { title: '查询', name: 'peony-list-query' },
            { title: '批量导出', name: 'peony-list-batch-export' },
            { title: '导出全部', name: 'peony-list-export-all' }
          ]
        },
        component: () => import('@/views/business/peony/car_number_match_track.vue')
      },
      {
        path: '/peony/nozzle_no_match_track',
          name: 'NozzleNoMatchTrackList',
        meta: {
          title: '油枪车辆识别情况跟踪',
          privilege: [
            { title: '查询', name: 'peony-list-query' },
            { title: '批量导出', name: 'peony-list-batch-export' },
            { title: '导出全部', name: 'peony-list-export-all' }
          ]
        },
        component: () => import('@/views/business/peony/nozzle_no_match_track.vue')
      },
      {
        path: '/peony/car_number_revise',
        name: 'CarNumberReviseList',
        meta: {
          title: '车牌矫正',
          privilege: [
            { title: '查询', name: 'peony-list-query' },
            { title: '批量导出', name: 'peony-list-batch-export' },
            { title: '导出全部', name: 'peony-list-export-all' }
          ]
        },
        component: () => import('@/views/business/peony/car_number_revise.vue')
      },
      {
        path: '/peony/car_number_trace',
        name: 'CarNumberTraceList',
        meta: {
          title: '车牌跟踪',
          privilege: [
            { title: '查询', name: 'peony-list-query' },
            { title: '批量导出', name: 'peony-list-batch-export' },
            { title: '导出全部', name: 'peony-list-export-all' }
          ]
        },
        component: () => import('@/views/business/peony/car_number_trace.vue')
      },
      {
        path: '/peony/car_traffic_flow',
        name: 'CarTrafficFlowList',
        meta: {
          title: '车流走势',
          privilege: [
            { title: '查询', name: 'peony-list-query' },
            { title: '批量导出', name: 'peony-list-batch-export' },
            { title: '导出全部', name: 'peony-list-export-all' }
          ]
        },
        component: () => import('@/views/business/peony/car_traffic_flow.vue')
      },
      {
        path: '/peony/car_growth_analyse',
        name: 'CarGrowthAnalyseList',
        meta: {
          title: '车流同(环)比',
          privilege: [
            { title: '查询', name: 'peony-list-query' },
            { title: '批量导出', name: 'peony-list-batch-export' },
            { title: '导出全部', name: 'peony-list-export-all' }
          ]
        },
        component: () => import('@/views/business/peony/car_growth_analyse.vue')
      }
    ]
  }
];
