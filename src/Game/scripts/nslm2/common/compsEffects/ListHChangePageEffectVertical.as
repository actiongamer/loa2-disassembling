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
   
   public class ListHChangePageEffectVertical implements IDispose
   {
       
      
      private var list:List;
      
      public var fakeBox:MzSprite;
      
      private var preChangeBmd:BitmapData;
      
      private var preChangeBm:Bitmap;
      
      private var dir:int;
      
      public function ListHChangePageEffectVertical(param1:List)
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
         TweenLite.killTweensOf(this.list.content);
         this.list.content.x = 0;
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
         list.content.y = dir == 3?preChangeBmd.height:-preChangeBmd.height;
         preChangeBm = new Bitmap(preChangeBmd);
         this.fakeBox.addChild(preChangeBm);
         preChangeBm.x = 0;
         preChangeBm.y = list.content.y;
         preChangeBmd = null;
         list.commitMeasure();
         playAnim();
      }
      
      private function playAnim() : void
      {
         TweenLite.to(this.preChangeBm,0.2,{"y":(dir == 3?-this.preChangeBm.height:Number(this.preChangeBm.height))});
         TweenLite.to(this.list.content,0.2,{
            "y":0,
            "onComplete":playAnimCpl
         });
      }
      
      private function playAnimBmdCpl(param1:Bitmap) : void
      {
      }
      
      private function playAnimCpl() : void
      {
         this.clear();
         if(this.list.content.parent != this.list)
         {
            this.list.addChild(list.content);
            list.content.x = 0;
         }
         DisplayUtils.removeSelf(fakeBox);
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
