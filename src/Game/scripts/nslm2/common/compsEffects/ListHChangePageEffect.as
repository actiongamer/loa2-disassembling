package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.List;
   import com.mz.core.display.MzSprite;
   import com.greensock.TweenLite;
   import com.mz.core.utils.DisplayUtils;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import flash.geom.Rectangle;
   import morn.core.handlers.Handler;
   
   public class ListHChangePageEffect implements IDispose
   {
       
      
      protected var list:List;
      
      public var fakeBox:MzSprite;
      
      protected var preChangeBmd:BitmapData;
      
      protected var preChangeBm:Bitmap;
      
      protected var dir:int;
      
      public var _cplHandler;
      
      protected var _time:Number = 0.2;
      
      public function ListHChangePageEffect(param1:List)
      {
         super();
         this.list = param1;
         this.fakeBox = new MzSprite();
      }
      
      public function clear() : void
      {
         if(preChangeBm != null)
         {
            TweenLite.killTweensOf(this.preChangeBm);
            DisplayUtils.removeSelf(preChangeBm);
            preChangeBm = null;
         }
         if(preChangeBmd != null)
         {
            preChangeBmd.dispose();
            preChangeBmd = null;
         }
         if(this.list && this.list.content)
         {
            TweenLite.killTweensOf(this.list.content);
            this.list.content.x = 0;
            if(this.list.content.parent != this.list)
            {
               this.list.addChild(list.content);
               list.content.x = 0;
            }
         }
         DisplayUtils.removeSelf(fakeBox);
      }
      
      public function preChange() : void
      {
         clear();
         preChangeBmd = new BitmapData(list.content.width,list.content.height,true,0);
         preChangeBmd.draw(this.list.content);
      }
      
      public function afterChange(param1:int) : void
      {
         this.dir = param1;
         list.addChild(fakeBox);
         fakeBox.scrollRect = new Rectangle(0,0,list.content.width,list.content.height);
         fakeBox.addChild(list.content);
         list.content.x = getListInitX();
         preChangeBm = new Bitmap(preChangeBmd);
         this.fakeBox.addChild(preChangeBm);
         preChangeBm.x = 0;
         preChangeBm.y = list.content.y;
         preChangeBmd = null;
         list.commitMeasure();
         playAnim();
      }
      
      protected function getListInitX() : Number
      {
         return dir == 1?preChangeBmd.width:-preChangeBmd.width;
      }
      
      protected function playAnim() : void
      {
         TweenLite.to(this.preChangeBm,_time,{"x":(dir == 1?-this.preChangeBm.width:Number(this.preChangeBm.width))});
         TweenLite.to(this.list.content,_time,{
            "x":0,
            "onComplete":playAnimCpl
         });
      }
      
      protected function playAnimBmdCpl(param1:Bitmap) : void
      {
      }
      
      protected function playAnimCpl() : void
      {
         if(_cplHandler)
         {
            Handler.execute(_cplHandler);
         }
         this.clear();
      }
      
      public function setCplHandler(param1:*) : ListHChangePageEffect
      {
         _cplHandler = param1;
         return this;
      }
      
      public function setTime(param1:Number) : ListHChangePageEffect
      {
         _time = param1;
         return this;
      }
      
      public function dispose() : void
      {
         if(list != null)
         {
            list = null;
         }
      }
   }
}
