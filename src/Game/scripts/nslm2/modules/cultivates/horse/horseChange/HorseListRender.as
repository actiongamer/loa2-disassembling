package nslm2.modules.cultivates.horse.horseChange
{
   import game.ui.horseModules.horseChange.HorseListRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.modules.cultivates.horse.HorseService;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   import flash.filters.GlowFilter;
   import nslm2.common.ctrls.TSM;
   
   public class HorseListRender extends HorseListRenderUI implements IObserver
   {
      
      public static const HORSE_LIST_RENDER_FILTER_CHANGE:String = "heroTextFilterChange";
       
      
      private var tsms:TSMDict;
      
      public function HorseListRender()
      {
         super();
         tsms = new TSMDict();
         tsms.addTSM(new TSM(this.img_using,0.3).addState(1,{"alpha":1}).addState(2,{"alpha":0}).addState(3,{"alpha":0}).addState(404,{"alpha":0}));
         tsms.addTSM(new TSM(this.redPoint,0.3).addState(1,{"alpha":0}).addState(2,{"alpha":0}).addState(3,{"alpha":1}).addState(404,{"alpha":0}));
         tsms.addTSM(new TSM(this.img_lock,0.3).addState(1,{"alpha":0}).copyState(2,1).copyState(3,1).copyState(404,0));
      }
      
      override protected function validateTxtState() : void
      {
         if(this.stcSaddlehorseVo)
         {
            switch(int(HorseService.ins.getState(stcSaddlehorseId)) - 1)
            {
               case 0:
                  tsms.toState(1);
                  this.img_quality.filters = null;
                  this.img_icon.filters = null;
                  ObserverMgr.ins.unregObserver(this);
                  break;
               case 1:
                  tsms.toState(2);
                  this.img_quality.filters = null;
                  this.img_icon.filters = null;
                  ObserverMgr.ins.unregObserver(this);
                  break;
               case 2:
                  tsms.toState(3);
                  this.img_quality.filters = null;
                  this.img_icon.filters = null;
                  ObserverMgr.ins.regObserver(this);
            }
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["heroTextFilterChange"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("heroTextFilterChange" === _loc4_)
         {
            _loc3_ = FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(stcSaddlehorseVo.quality));
            _loc3_.strength = param2;
            this.filters = [_loc3_];
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
