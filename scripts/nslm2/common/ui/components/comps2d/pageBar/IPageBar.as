package nslm2.common.ui.components.comps2d.pageBar
{
   import com.mz.core.interFace.IDisplayObject;
   import morn.core.components.List;
   
   public interface IPageBar extends IDisplayObject
   {
       
      
      function bindList(param1:List) : IPageBar;
      
      function pageTo(param1:int, param2:Boolean) : void;
      
      function setGetDataHandler(param1:*) : void;
   }
}
