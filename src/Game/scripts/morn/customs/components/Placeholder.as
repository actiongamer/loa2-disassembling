package morn.customs.components
{
   import morn.core.components.Component;
   import flash.display.DisplayObject;
   import com.mz.core.utils.DisplayUtils;
   
   public class Placeholder extends Component
   {
       
      
      public function Placeholder()
      {
         super();
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.callLater(draw);
      }
      
      protected function draw() : void
      {
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
         callLater(draw);
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         callLater(draw);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.graphics.clear();
      }
      
      public function replaceWithDisplay(param1:DisplayObject) : DisplayObject
      {
         DisplayUtils.addChildAbove(param1,this);
         param1.x = this.x;
         param1.y = this.y;
         this.dispose();
         return param1;
      }
      
      public function replaceWith(param1:Component) : Component
      {
         copyParamsNumber(param1,["width","height","top","bottom","left","right","centerX","centerY"]);
         replaceWithDisplay(param1);
         return param1;
      }
   }
}
