package nslm2.modules.funnies.arenas.mains
{
   import game.ui.arenas.mains.ArenaUnitSayUI;
   import com.greensock.TweenLite;
   
   public class ArenaUnitSay extends ArenaUnitSayUI
   {
       
      
      public function ArenaUnitSay()
      {
         super();
         this.mouseEvent = false;
         this.alpha = 0;
      }
      
      public function show(param1:String, param2:int, param3:int) : void
      {
         this.txt_content.text = param1;
         this.txt_content.commitMeasure();
         bgImage.height = txt_content.height + 30;
         this.height = txt_content.height + 30;
         this.x = param2 - this.width / 2 - 80;
         param3 = Math.max(param3,0);
         param3 = param3 - this.height;
         param3 = param3 + 60;
         this.y = param3;
         this.alpha = 0;
         TweenLite.to(this,0.3,{
            "alpha":1,
            "y":param3
         });
      }
      
      public function hide() : void
      {
         TweenLite.to(this,0.2,{
            "alpha":0,
            "y":this.y - 20
         });
      }
   }
}
