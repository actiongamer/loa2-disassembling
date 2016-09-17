package nslm2.common.compsEffects
{
   import com.mz.core.interFace.IDispose;
   import flash.display.Bitmap;
   import com.greensock.TweenLite;
   import com.greensock.easing.Cubic;
   import morn.core.components.List;
   
   public class ListHChangeOneEffect extends ListHChangePageEffect implements IDispose
   {
       
      
      public function ListHChangeOneEffect(param1:List)
      {
         super(param1);
      }
      
      override protected function getListInitX() : Number
      {
         return dir == 1?(preChangeBmd.width + this.list.spaceX) / this.list.repeatX:Number(-(preChangeBmd.width + this.list.spaceX) / this.list.repeatX);
      }
      
      override protected function playAnim() : void
      {
         TweenLite.to(this.preChangeBm,_time,{
            "x":(dir == 1?-(preChangeBm.width + this.list.spaceX) / this.list.repeatX:Number((preChangeBm.width + this.list.spaceX) / this.list.repeatX)),
            "ease":Cubic.easeIn
         });
         TweenLite.to(this.list.content,_time,{
            "x":0,
            "onComplete":playAnimCpl,
            "ease":Cubic.easeIn
         });
      }
   }
}
