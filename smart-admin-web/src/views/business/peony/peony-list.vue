<template>
  <div>
    <Card class="smart-query-card">
      <!------ 查询条件第一行 begin------->
      <Row class="smart-query-form-row">
        <span>
          创建时间: <DatePicker placeholder="选择创建日期范围" split-panels style="width: 200px" type="daterange" v-model="queryForm.createTimeRange"/>
        </span>
        <span>
          ID : <Input placeholder="请输入ID" style="width: 180px" v-model="queryForm.id"/>
        </span>
        <span>
          品种 : <Input placeholder="请输入品种" style="width: 180px" v-model="queryForm.kind"/>
        </span>
        <span>
          名字 : <Input placeholder="请输入名字" style="width: 180px" v-model="queryForm.name"/>
        </span>
        <span>
          颜色 : <Input placeholder="请输入颜色" style="width: 180px" v-model="queryForm.color"/>
        </span>
        <ButtonGroup>
          <Button @click="queryList" icon="ios-search" type="primary" v-privilege="'peony-list-query'">查询</Button>
          <Button @click="resetQueryList" icon="md-refresh" type="default" v-privilege="'peony-list-query'">重置</Button>
        </ButtonGroup>
      </Row>
    </Card>

    <Card class="warp-card">
      <!-------操作按钮行 begin------->
      <Row class="marginBottom10">
        <Button :loading="allExportBtnLoading" @click="exportAll" class="marginLeft10 float-right"
                icon="ios-cloud-download-outline" size="small" type="warning" v-privilege="'peony-list-export-all'">导出全部</Button>
        <Button :loading="batchExportBtnLoading" @click="batchExport" class="marginLeft10 float-right"
                icon="ios-download-outline" size="small" type="warning" v-privilege="'peony-list-batch-export'">批量导出</Button>
      </Row>
      <!-------操作按钮行 end------->

      <!-------表格列表 begin------->
      <Table :columns="mainTable.columnArray" :data="mainTable.data" :loading="mainTable.loading"
             @on-sort-change="handleSortChange" border highlight-row ref="mainTable">
        <template slot-scope="{ row, index }" slot="imageUrl">
          <img width="40" height="40" v-if="index % 2 === 0" src="http:// q8deiydpv.bkt.clouddn.com/image/peony1.jpg"/>
          <img v-if="index % 2 === 1" width="40" height="40" src="http:// q8deiydpv.bkt.clouddn.com/image/peony2.jpg"/>
        </template>
      </Table>

      <Page
        :current="queryForm.pageNum"
        :page-size="queryForm.pageSize"
        :page-size-opts="mainTablePage.pageSizeOps"
        :total="mainTablePage.total"
        @on-change="changeMainTablePagePageNum"
        @on-page-size-change="changeMainTablePagePageSize"
        class="smart-query-table-page"
        show-elevator
        show-sizer
        show-total
      />
    </Card>
    <!-------表格列表 end------->
  </div>
</template>

<script>
import { dateTimeRangeConvert } from '@/lib/util';
import { PAGE_SIZE_OPTIONS } from '@/constants/table-page';
import { peonyApi } from '@/api/peony';
import PeonyListForm from './components/peony-list-form';

const PAGE_SIZE_INIT = 20;
export default {
  name: 'PeonyList',
  components: {
    PeonyListForm
  },
  props: {},
  data  () {
    return {
      /* -------------------------添加、更新表单 ------------------------- */
      saveModal: {
        show: false,
        isUpdate: false,
        updateData: null
      },
      /* -------------------------批量操作------------------------- */
      // 批量刪除彈出框
      batchDeleteModal: {
        show: false
      },
      // 表格多选选中的元素数组
      mainTableSelectArray: [],
      /* -------------------------导出操作------------------------- */
      // 批量导出loading按钮
      batchExportBtnLoading: false,
      // 导出全部loading按钮
      allExportBtnLoading: false,
      /* -------------------------查询条件相关数据-------------------- */
      // 搜索表单
      queryForm: {
        // ID
        id: null,
        // 品种
        kind: null,
        // 名字
        name: null,
        // 颜色
        color: null,
        createTimeRange: ['', ''],
        updateTimeRange: ['', ''],
        pageNum: 1,
        pageSize: PAGE_SIZE_INIT,
        orders: []
      },
      // 是否展示更多搜索条件
      showMoreQueryConditionFlag: false,
      /*  -------------------------表格相关数据------------------------- */
      // 表格分页
      mainTablePage: {
        total: 0,
        pageSizeOps: PAGE_SIZE_OPTIONS
      },
      // 表格
      mainTable: {
        // 加载中
        loading: false,
        // 表格数据
        data: [],
        // 表格列
        columnArray: [
          {
            title: '片区',
            align: 'center'
          },
          {
            title: '站点',
            key: 'id',
            align: 'center'
          },
          {
            title: '当天',
            key: 'kind',
            align: 'center',
            renderHeader: (h, params) => {
              return h('span', { style: { color: '#0e0e0e' } }, '2022-01-01');
            },
            children: [
              {
                title: '小计',
                key: 't_sum',
                align: 'center',
                sortable: true
              },
              {
                title: '汽油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'q_sum',
                    align: 'center',
                    sortable: true
                  },
                  {
                    title: '92#',
                    key: '92',
                    align: 'center',
                    sortable: true
                  },
                  {
                    title: '95#',
                    key: '95',
                    align: 'center',
                    sortable: true
                  }
                ]
              },
              {
                title: '柴油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'c_sum',
                    align: 'center',
                    sortable: true
                  },
                  {
                    title: '0#',
                    key: '0',
                    align: 'center',
                    sortable: true
                  }
                ]
              }
            ]
          },
          {
            title: '环比',
            key: 'month_on_month',
            align: 'center',
            renderHeader: (h, params) => {
              return h('span', { style: { color: '#0e0e0e' } }, '2022-01-01');
            },
            children: [
              {
                title: '小计',
                key: 't_sum',
                align: 'center',
                sortable: true
              },
              {
                title: '汽油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'q_sum',
                    align: 'center',
                    sortable: true
                  },
                  {
                    title: '92#',
                    key: '92',
                    align: 'center',
                    sortable: true
                  },
                  {
                    title: '95#',
                    key: '95',
                    align: 'center',
                    sortable: true
                  }
                ]
              },
              {
                title: '柴油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'c_sum',
                    align: 'center',
                    sortable: true
                  },
                  {
                    title: '0#',
                    key: '0',
                    align: 'center',
                    sortable: true
                  }
                ]
              }
            ]
          },
          {
            title: '同比',
            key: 'year_on_year',
            align: 'center',
            renderHeader: (h, params) => {
              return h('span', { style: { color: '#0e0e0e' } }, '2022-01-01');
            },
            children: [
              {
                title: '小计',
                key: 't_sum',
                align: 'center',
                sortable: true
              },
              {
                title: '汽油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'q_sum',
                    align: 'center',
                    sortable: true
                  },
                  {
                    title: '92#',
                    key: '92',
                    align: 'center',
                    sortable: true
                  },
                  {
                    title: '95#',
                    key: '95',
                    align: 'center',
                    sortable: true
                  }
                ]
              },
              {
                title: '柴油',
                align: 'center',
                children: [
                  {
                    title: '小计',
                    key: 'c_sum',
                    align: 'center',
                    sortable: true
                  },
                  {
                    title: '0#',
                    key: '0',
                    align: 'center',
                    sortable: true
                  }
                ]
              }
            ]
          },
          {
            title: '同比增幅',
            key: 'year_on_year_increase'
          },
          {
            title: '环比增幅',
            key: 'month_on_month_increase '
          }
        ]
      }
    };
  },
  computed: {},
  watch: {},
  filters: {},
  created () {
  },
  mounted () {
    this.queryList();
  },
  beforeCreate () {
  },
  beforeMount () {
  },
  beforeUpdate () {
  },
  updated () {
  },
  beforeDestroy () {
  },
  destroyed () {
  },
  activated () {
  },
  methods: {
    /* -------------------------查询相关 begin------------------------- */
    convertQueryParam () {
      let createTimeArray = dateTimeRangeConvert(this.queryForm.createTimeRange);
      let updateTimeArray = dateTimeRangeConvert(this.queryForm.updateTimeRange);
      return {
        ...this.queryForm,
        createTimeBegin: createTimeArray[0],
        createTimeEnd: createTimeArray[1],
        updateTimeBegin: updateTimeArray[0],
        updateTimeEnd: updateTimeArray[1]
      };
    },
    // 查询
    async queryList () {
      this.mainTable.loading = true;
      try {
        let params = this.convertQueryParam();
        let result = await peonyApi.queryPeony(params);
        this.mainTable.data = result.data.list;
        this.mainTablePage.total = result.data.total;
      } finally {
        this.mainTable.loading = false;
      }
    },
    // 重置查询
    resetQueryList () {
      let pageSize = this.queryForm.pageSize;
      this.queryForm = {
        id: null,
        kind: null,
        name: null,
        color: null,
        createTimeRange: ['', ''],
        updateTimeRange: ['', ''],
        pageNum: 1,
        pageSize: pageSize,
        orders: []
      };
      this.queryList();
    },
    // 修改页码
    changeMainTablePagePageNum (pageNum) {
      this.queryForm.pageNum = pageNum;
      this.queryList();
    },
    // 修改页大小
    changeMainTablePagePageSize (pageSize) {
      this.queryForm.pageNum = 1;
      this.queryForm.pageSize = pageSize;
      this.queryList();
    },
    // 处理排序
    handleSortChange (column) {
      if (column.order === 'normal') {
        this.queryForm.orders = [];
      } else {
        this.queryForm.orders = [
          {
            column: column.column.tableColumn,
            asc: column.order === 'asc'
          }
        ];
      }
      this.queryList();
    },
    /* -------------------------查询相关 end------------------------- */

    /* -------------------------批量操作 begin------------------------- */
    // 显示批量删除弹窗
    showBatchDeleteModal () {
      if (!this.validateMainTableSelection()) {
        return;
      }
      this.batchDeleteModal.show = true;
    },
    // 批量删除
    async batchDelete () {
      this.$Spin.show();
      await peonyApi.batchDeletePeony(
        this.mainTableSelectArray.map(e => e.id)
      );
      this.batchDeleteModal.show = false;
      this.$Message.success('刪除成功');
      this.$Spin.hide();
      this.queryList();
    },
    // 清空选中
    clearMainTableSelection () {
      this.mainTableSelectArray = [];
    },
    // 校验是否有选中
    validateMainTableSelection () {
      this.mainTableSelectArray = this.$refs.mainTable.getSelection();
      if (this.mainTableSelectArray.length < 1) {
        this.$Message.error('请选择至少一条数据');
        return false;
      }
      return true;
    },
    /* -------------------------批量操作 end------------------------- */

    /* -------------------------导入导出 begin------------------------- */
    // 导出全部
    async exportAll () {
      try {
        this.allExportBtnLoading = true;
        let params = this.convertQueryParam();
        await peonyApi.exportAll(params);
      } catch (e) {
        console.log(e);
      } finally {
        this.allExportBtnLoading = false;
      }
    },
    // 批量导出
    async batchExport () {
      if (!this.validateMainTableSelection()) {
        return;
      }
      try {
        this.batchExportBtnLoading = true;
        await peonyApi.batchExport(this.mainTableSelectArray.map(e => e.id));
      } catch (e) {
        console.log(e);
      } finally {
        this.batchExportBtnLoading = false;
      }
    },
    /* -------------------------导入导出 end------------------------- */

    /* -------------------------添加，修改 表单 begin------------------------- */
    // 显示添加表单
    showAddPeonyForm () {
      this.saveModal.isUpdate = false;
      this.saveModal.show = true;
    },
    showEditPeonyForm (updateObject) {
      this.saveModal.isUpdate = true;
      this.saveModal.updateData = updateObject;
      this.saveModal.show = true;
    },
    saveFormClose () {
      this.saveModal.show = false;
      this.queryList();
    }
    /* -------------------------添加，修改 表单 end------------------------- */
  }
};
</script>
