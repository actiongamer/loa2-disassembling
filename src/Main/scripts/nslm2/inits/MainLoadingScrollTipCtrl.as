package nslm2.inits
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.configs.ClientConfig;
   import flash.text.TextFormat;
   
   public class MainLoadingScrollTipCtrl
   {
       
      
      private var ui:MovieClip;
      
      private var txt1:TextField;
      
      private var txt2:TextField;
      
      public var tipArr:Array;
      
      private var msgArr:Vector.<String>;
      
      private var pauseCount:int = 0;
      
      public function MainLoadingScrollTipCtrl(param1:*)
      {
         msgArr = new Vector.<String>();
         super();
         this.ui = param1;
         ui.contentBox.mask = ui.maskBox;
         txt1 = ui.contentBox.txt1;
         txt2 = ui.contentBox.txt2;
         this.txt1.text = "";
         this.txt2.text = "";
         if(ClientConfig.isRuLang())
         {
            txt1.defaultTextFormat = new TextFormat("Arial",12);
         }
      }
      
      public function show(param1:int, param2:int, param3:int) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = undefined;
         msgArr.length = 0;
         var _loc5_:int = tipArr.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = tipArr[_loc6_];
            if(param1 >= _loc4_.vipMin && param1 <= _loc4_.vipMax)
            {
               if(param2 >= _loc4_.lvMin && param2 <= _loc4_.lvMax)
               {
                  if(param3 >= _loc4_.triggerMin && param3 <= _loc4_.triggerMax)
                  {
                     msgArr.push(_loc4_.content);
                  }
               }
            }
            _loc6_++;
         }
         if(msgArr.length < 2)
         {
            _loc6_ = msgArr.length;
            while(_loc6_ < 2)
            {
               msgArr.push("");
               _loc6_++;
            }
         }
         this.txt1.text = msgArr[MathUtil.randomInt(msgArr.length - 1,0)];
      }
      
      private function showMsgs() : void
      {
      }
      
      public function dispose() : void
      {
         ui = null;
      }
   }
}
