package morn.editor.core
{
   import morn.customs.expands.ICommitMeasure;
   
   public interface IComponent extends ICommitMeasure
   {
       
      
      function get comXml() : XML;
      
      function set comXml(param1:XML) : void;
   }
}
