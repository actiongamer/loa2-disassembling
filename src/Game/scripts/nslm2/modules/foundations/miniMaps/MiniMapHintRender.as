package nslm2.modules.foundations.miniMaps
{
   import game.ui.miniMaps.MiniMapHintRenderUI;
   import nslm2.modules.foundations.miniTasks.vo.HintVo;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import nslm2.common.ui.components.comps2d.others.RedPointNum;
   
   public class MiniMapHintRender extends MiniMapHintRenderUI
   {
       
      
      private var _data:HintVo;
      
      public function MiniMapHintRender()
      {
         super();
         this.addEventListener("click",clickHandler);
         this.buttonMode = true;
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("task_notice_auto_track",_data.npgRelationId);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as HintVo;
         if(_data)
         {
            img_title.skin = UrlLib.hintBoxIcon(_data.id % 3);
            txt_target.text = _data.text;
            txt_target.mouseChildren = false;
            redPoi.count = _data.avail_count;
            redPoi.x = txt_target.x + txt_target.textWidth + 5;
         }
      }
      
      public function set tweenLineDataSource(param1:Object) : void
      {
         value = param1;
         this.x = 190;
         this.alpha = 0;
         dataSource = value;
         TweenLite.killTweensOf(this);
         TweenLite.to(this,_data.id * 0.2,{
            "x":0,
            "alpha":1,
            "onComplete":function(param1:DisplayObject):void
            {
               TweenLite.killTweensOf(param1);
            },
            "onCompleteParams":[this]
         });
      }
      
      public function get redPoi() : RedPointNum
      {
         return countPoint as RedPointNum;
      }
      
      override public function dispose() : void
      {
         if(this.hasEventListener("click"))
         {
            this.removeEventListener("click",clickHandler);
         }
         super.dispose();
      }
   }
}
