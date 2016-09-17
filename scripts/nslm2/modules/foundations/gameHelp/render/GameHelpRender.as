package nslm2.modules.foundations.gameHelp.render
{
   import game.ui.gameHelpModule.render.GameHelpRenderUI;
   import nslm2.modules.foundations.gameHelp.vo.GameHelpVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Label;
   import flash.events.Event;
   import morn.core.components.Box;
   import com.greensock.TweenLite;
   
   public class GameHelpRender extends GameHelpRenderUI
   {
       
      
      public var status:int;
      
      private const EXTENED:int = 1;
      
      private const NOT_EXTENED:int = 0;
      
      public function GameHelpRender()
      {
         super();
         this.img_extend.addEventListener("click",extendHandler);
      }
      
      public function get vo() : GameHelpVo
      {
         return this.dataSource as GameHelpVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         status = 0;
         if(this.vo)
         {
            this.label_question.text = LocaleMgr.ins.getStr(this.vo.question);
            this.label_answer2.text = LocaleMgr.ins.getStr(this.vo.answer);
            this.label_answer.text = LocaleMgr.ins.getStr(this.vo.answer);
            this.label_answer.visible = false;
            if(rowNumber(label_answer) <= 2)
            {
               this.img_extend.visible = false;
            }
            else
            {
               this.img_extend.visible = true;
            }
            resetExtendStatus(false);
         }
      }
      
      private function rowNumber(param1:Label) : int
      {
         return (param1.height - 3) / 18;
      }
      
      private function extendHandler(param1:Event) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         this.img_extend.mouseEvent = false;
         var _loc2_:Box = this.parent as Box;
         _loc2_.removeChild(this);
         _loc2_.addChild(this);
         _loc5_ = 0;
         while(_loc5_ < _loc2_.numChildren)
         {
            _loc4_ = _loc2_.getChildAt(_loc5_) as GameHelpRender;
            if(_loc4_ != this)
            {
               if(_loc4_.status == 1)
               {
                  _loc4_.resetExtendStatus();
               }
            }
            _loc5_++;
         }
         if(status == 0)
         {
            _loc3_ = rowNumber(label_answer);
            TweenLite.to(this.img_bg,0.2,{"height":81 + 18 * ((_loc3_ > 2?_loc3_:2) - 2)});
            TweenLite.to(this.img_extend,0.2,{
               "y":66 + 18 * ((_loc3_ > 2?_loc3_:2) - 2),
               "onComplete":changeHandler
            });
         }
         else
         {
            resetExtendStatus();
         }
      }
      
      public function resetExtendStatus(param1:Boolean = true) : void
      {
         this.label_answer.visible = false;
         this.label_answer2.visible = true;
         if(param1)
         {
            TweenLite.to(this.img_bg,0.2,{"height":81});
            TweenLite.to(this.img_extend,0.2,{
               "y":64,
               "onComplete":changeHandler
            });
         }
         else
         {
            this.img_bg.height = 81;
            this.img_extend.y = 64;
            this.img_extend.rotation = -90;
            this.img_extend.x = 525;
         }
      }
      
      private function changeHandler() : void
      {
         if(status == 0)
         {
            TweenLite.to(this.img_extend,0.1,{
               "rotation":90,
               "x":522
            });
            status = 1;
            this.label_answer.visible = true;
         }
         else
         {
            TweenLite.to(this.img_extend,0.1,{
               "rotation":-90,
               "x":525
            });
            status = 0;
         }
         this.img_extend.mouseEvent = true;
      }
   }
}
