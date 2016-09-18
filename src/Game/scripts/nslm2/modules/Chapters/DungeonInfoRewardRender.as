package nslm2.modules.Chapters
{
   import game.ui.chapters.DungeonInfoRewardRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.bag.itemModuels.BagModel;
   import com.greensock.TweenLite;
   import nslm2.utils.LabelUtils;
   
   public class DungeonInfoRewardRender extends DungeonInfoRewardRenderUI implements IObserver
   {
       
      
      private var _lastCount:int;
      
      public function DungeonInfoRewardRender()
      {
         super();
      }
      
      public function get wealthVo() : WealthVo
      {
         return this.dataSource as WealthVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(wealthVo)
         {
            ObserverMgr.ins.regObserver(this);
            this.render_wealth.dataSource = wealthVo;
            refreshNeedText();
         }
         else
         {
            this.txt_needNum.visible = false;
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      private function refreshNeedText() : void
      {
         if(wealthVo.stcItemVo)
         {
            if(BagModel.ins.getStcCount(wealthVo.sid) > _lastCount && _lastCount != 0)
            {
               TweenLite.killTweensOf(this.txt_needNum);
               TweenLite.to(this.txt_needNum,0.2,{"scale":1.4});
               TweenLite.to(this.txt_needNum,0.2,{
                  "scale":1,
                  "delay":0.2
               });
            }
            _lastCount = BagModel.ins.getStcCount(wealthVo.sid);
            var _loc1_:* = wealthVo.stcItemVo.kind;
            if(81 !== _loc1_)
            {
               if(21 !== _loc1_)
               {
                  if(51 !== _loc1_)
                  {
                     this.txt_needNum.visible = false;
                  }
                  else
                  {
                     this.txt_needNum.text = LabelUtils.countNeedStr(BagModel.ins.getStcCount(wealthVo.sid),wealthVo.stcItemVo.equipPieceComposeCount);
                     this.txt_needNum.visible = true;
                  }
               }
               else
               {
                  this.txt_needNum.visible = true;
                  this.txt_needNum.text = LabelUtils.countNeedStr(BagModel.ins.getStcCount(wealthVo.sid),wealthVo.stcItemVo.heroPieceNeed);
               }
            }
            else
            {
               this.txt_needNum.visible = true;
               this.txt_needNum.text = LabelUtils.countNeedStr(BagModel.ins.getStcCount(wealthVo.sid),wealthVo.stcItemVo.godHoodEquipNeed);
            }
         }
         else
         {
            this.txt_needNum.visible = false;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["notice_refresh_module_need_resource_data"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("notice_refresh_module_need_resource_data" === _loc3_)
         {
            refreshNeedText();
         }
      }
   }
}
