import { postAxios, getAxios, postDownloadAxios } from '@/lib/http';

export const oilApi = {
    //
  getStationList: (data) => {
    return postAxios('/oil/station/page/query', data);
  },
  getStationLinkageMenu: (data) => {
    return postAxios('/oil/station/linkagemenu/query', data);
  },
  getTradeList: (data) => {
    return postAxios('/oil/trade/page/query', data);
  },
  getMatchRatio: (data) => {
    return postAxios('/oil/trade/matchratio/query', data);
  },
  getInOutNumList: (data) => {
    return postAxios('/oil/trade/inoutnum/page/query', data);
  },
  getMatchTrackList: (data) => {
    return postAxios('/oil/trade/matchtrack/page/query', data);
  },
  getNozzleNoMatchTrackList: (data) => {
    return postAxios('/oil/trade/matchtrack/nozzleno/page/query', data);
  },
  getCarTraceList: (data) => {
    return postAxios('/oil/trade/cartrace/page/query', data);
  },



  // 导出全部  @author 卓大
  exportAll:(data)=>{
    return postDownloadAxios('/peony/export/all',data);
  },
  // 批量导出  @author 卓大
  batchExport: (idList) => {
    return postDownloadAxios('/peony/export/batch', idList);
  },
};
