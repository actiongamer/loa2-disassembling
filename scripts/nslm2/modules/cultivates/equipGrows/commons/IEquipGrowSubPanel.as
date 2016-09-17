package nslm2.modules.cultivates.equipGrows.commons
{
   import com.mz.core.interFace.IFadeView;
   import morn.customs.components.ClipList;
   
   public interface IEquipGrowSubPanel extends IFadeView
   {
       
      
      function show() : void;
      
      function updateLiansuoLvl() : void;
      
      function set weaoponRef(param1:Object) : void;
      
      function get liansuoTxt() : ClipList;
   }
}
