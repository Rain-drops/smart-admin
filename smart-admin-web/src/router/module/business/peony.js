import Main from '@/components/main';
// t_peony路由
export const peony = [
  {
    path: '/peony',
    name: 'Peony',
    component: Main,
    meta: {
      title: '牡丹管理',
      icon: 'icon iconfont iconyoujianguanli'
    },
    children: [
      //  牡丹花 列表
      {
        path: '/peony/peony-list',
        name: 'PeonyList',
        meta: {
          title: '牡丹花列表',
          privilege: [
            { title: '查询', name: 'peony-list-query' },
            { title: '批量导出', name: 'peony-list-batch-export' },
            { title: '导出全部', name: 'peony-list-export-all' }
          ]
        },
        component: () => import('@/views/business/peony/peony-list.vue')
      }
    ]
  }
];
