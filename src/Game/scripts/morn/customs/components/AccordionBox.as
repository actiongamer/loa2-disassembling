package morn.customs.components
{
   import morn.core.components.Box;
   import flash.geom.Rectangle;
   
   class AccordionBox extends Box
   {
       
      
      function AccordionBox()
      {
         super();
      }
      
      override public function set height(param1:Number) : void
      {
         if(this._height != param1)
         {
            .super.height = param1;
            this.scrollRect = new Rectangle(0,0,this.width,this.height);
         }
      }
   }
}
