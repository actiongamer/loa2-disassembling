package nslm2.modules.funnies.busyActivity.towers.funnys
{
   import game.ui.busyActivity.towers.funnys.TowerFunnyLayerRenderUI;
   import nslm2.modules.funnies.busyActivity.towers.services.stcVos.TowerStcVo_Tower;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   import morn.customs.FilterLib;
   
   public class TowerFunnyLayerRender extends TowerFunnyLayerRenderUI
   {
       
      
      public function TowerFunnyLayerRender()
      {
         super();
      }
      
      public function get vo() : TowerStcVo_Tower
      {
         return this.dataSource as TowerStcVo_Tower;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.txt_name.text = LocaleMgr.ins.getStr(13386011 + vo.layer);
            this.list_reward.repeatX = vo.rewardArr.length;
            this.list_reward.array = vo.rewardArr;
            this.list_reward.commitMeasure();
            if(this.vo.layer > TowerService.ins.stcModel.minLayer && this.vo.layer < TowerService.ins.stcModel.maxLayer)
            {
               if(TowerService.ins.needDown)
               {
                  (this.list_reward.cells[this.list_reward.array.length - 1] as TowerFunnyCellRender).showIconDown();
               }
            }
            if(this.vo.layer < TowerService.ins.stcModel.maxLayer)
            {
               (this.list_reward.cells[0] as TowerFunnyCellRender).showIconUp();
            }
            this.txt_name.x = 2 - this.listCellVo.dataIndex * 30;
         }
      }
      
      public function switchSelected(param1:Boolean) : void
      {
         if(param1)
         {
            this.txt_name.style = "重要提示绿";
            this.txt_name.filters = [FilterLib.BORDER_ORANGE];
         }
         else
         {
            this.txt_name.style = "重要提示黄";
            this.txt_name.filters = [];
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
