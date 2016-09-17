package nslm2.modules.cultivates.treasure.view
{
   import morn.customs.components.ClipList;
   
   public interface ITreasurePanel
   {
       
      
      function show() : void;
      
      function updateLiansuoLvl() : void;
      
      function set weaoponRef(param1:Object) : void;
      
      function get liansuoTxt() : ClipList;
   }
}
