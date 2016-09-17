package nslm2.modules.cultivates.lotteryHeroModules.results
{
   import game.ui.lotteryHeroModules.results.ResultListUI;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import nslm2.utils.WealthUtil;
   import morn.core.components.Box;
   import proto.HeroInfo;
   import com.greensock.TweenLite;
   
   public class ResultList extends ResultListUI
   {
       
      
      public function ResultList()
      {
         super();
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         super.btnCloseHandler(param1);
         this.dispatchEvent(new Event("evtResultClose",true));
      }
      
      public function show(param1:Array, param2:Array) : void
      {
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         this.list_rewards.array = WealthUtil.heroInfoToWealthVoArr(param1);
         this.list_rewards.commitMeasure();
         var _loc6_:Vector.<Box> = this.list_rewards.cells;
         var _loc5_:int = Math.min(param1.length,_loc6_.length);
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc4_ = param1[_loc7_];
            _loc3_ = _loc6_[_loc7_] as LotteryHeroResultRender;
            if(param2)
            {
               _loc3_.showImgNew(param2.indexOf(_loc4_.baseInfo.baseId) != -1);
            }
            else
            {
               _loc3_.showImgNew(false);
            }
            _loc7_++;
         }
         this.right = -this.width;
         TweenLite.to(this,0.3,{"right":0});
      }
   }
}
