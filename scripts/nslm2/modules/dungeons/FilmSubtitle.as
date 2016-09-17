package nslm2.modules.dungeons
{
   import game.ui.dungeonScene.FilmSubtitleUI;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import com.mz.core.utils.FilterUtil;
   import com.mz.core.logging.Log;
   import flash.utils.getTimer;
   import com.mz.core.utils.DisplayUtils;
   import com.greensock.TweenLite;
   
   public class FilmSubtitle extends FilmSubtitleUI
   {
       
      
      private var box:Box;
      
      private var cplHandler:Function;
      
      private var fade:int;
      
      private var time:int;
      
      private var txtArr:Array;
      
      private var color:uint = 16777215;
      
      private var size:int;
      
      private var bold:Object;
      
      public function FilmSubtitle()
      {
         box = new Box();
         txtArr = [];
         super();
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.bg.fillAlpha = 0;
      }
      
      private function createTxt(param1:String) : Label
      {
         var _loc2_:Label = new Label();
         _loc2_.alpha = 0;
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.color = this.color;
         _loc2_.size = this.size;
         _loc2_.bold = this.bold;
         _loc2_.width = vbox.width;
         _loc2_.align = "center";
         _loc2_.isHtml = true;
         _loc2_.autoSize = "center";
         _loc2_.labelFilterKind = "黑色1像素描边";
         _loc2_.text = param1;
         this.vbox.addChild(_loc2_);
         vbox.commitMeasure();
         box.addChild(this.txtBg);
         box.addChild(this.vbox);
         this.addChild(box);
         var _loc3_:int = 1;
         box.height = _loc3_;
         box.width = _loc3_;
         box.centerX = 0;
         box.centerY = -200;
         txtBg.filters = [FilterUtil.highLightFilter(-30)];
         txtBg.width = vbox.width + 40;
         txtBg.x = -txtBg.width / 2;
         txtBg.height = vbox.height;
         txtBg.y = -txtBg.height / 2;
         this.vbox.x = -this.vbox.width / 2;
         this.vbox.y = -this.vbox.height / 2;
         txtArr.push(_loc2_);
         return _loc2_;
      }
      
      public function setTF(param1:*, param2:int, param3:Boolean) : void
      {
         if(param1 != null && param1 != "")
         {
            this.color = param1;
         }
         else
         {
            this.color = 16777215;
         }
         if(param2 > 0)
         {
            size = param2;
         }
         else
         {
            size = 48;
         }
         this.bold = param3;
      }
      
      public function show(param1:String, param2:Function, param3:int, param4:int) : void
      {
         var _loc7_:int = 0;
         Log.debug(this,"show",getTimer(),App.timer.currFrame);
         this.cplHandler = param2;
         this.fade = param3;
         this.time = param4;
         var _loc6_:Array = param1.split("|");
         var _loc5_:int = _loc6_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            this.createTxt(_loc6_[_loc7_]);
            _loc7_++;
         }
         DisplayUtils.removeSelf(this.txt_content);
         this.showStep();
      }
      
      private function showStep() : void
      {
         var _loc1_:* = null;
         if(txtArr.length == 0)
         {
            TweenLite.delayedCall(this.time / 1000,this.hideStep);
         }
         else
         {
            _loc1_ = txtArr.shift();
            _loc1_.alpha = 0;
            TweenLite.to(_loc1_,fade / 1000,{
               "alpha":1,
               "onComplete":showStep
            });
         }
      }
      
      private function hideStep() : void
      {
         TweenLite.to(box,fade / 2 / 1000 * 0.2,{
            "scaleX":1.4,
            "scaleY":1.4
         });
         TweenLite.to(box,fade / 2 / 1000 * 0.8,{
            "delay":0.2,
            "scaleX":0,
            "scaleY":0,
            "alpha":0,
            "onComplete":hide
         });
      }
      
      private function hide() : void
      {
         cplHandler.call();
         if(this.isDisposed == false)
         {
            this.dispose();
         }
      }
   }
}
