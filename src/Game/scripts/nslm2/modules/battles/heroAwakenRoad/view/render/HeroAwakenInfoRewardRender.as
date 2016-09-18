package nslm2.modules.battles.heroAwakenRoad.view.render
{
   import game.ui.heroAwakenRoad.HeroAwakenItemRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.bag.itemModuels.BagModel;
   import com.greensock.TweenLite;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcGridNodeVo;
   import nslm2.utils.LabelUtils;
   
   public class HeroAwakenInfoRewardRender extends HeroAwakenItemRenderUI implements IObserver
   {
       
      
      private var _lastCount:int;
      
      public function HeroAwakenInfoRewardRender()
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
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:int = 0;
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
            if(!(int(wealthVo.stcItemVo.kind) - 82))
            {
               this.txt_needNum.visible = true;
               _loc2_ = StcMgr.ins.getItemVo(wealthVo.itemId);
               _loc3_ = StcMgr.ins.getGridNodeVo(int(_loc2_.extend_1));
               _loc1_ = _loc3_.cost_item.split(":")[2];
               this.txt_needNum.text = LabelUtils.countNeedStr(BagModel.ins.getStcCount(wealthVo.sid),_loc1_);
            }
            else
            {
               this.txt_needNum.visible = false;
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
