package org.specter3d.mvc
{
   import org.specter3d.interfaces.ICommand;
   import flash.utils.Dictionary;
   
   public class Command implements ICommand
   {
      
      private static var _modelMap:Dictionary;
       
      
      private var _data;
      
      private var _targetModel;
      
      private var _cmd;
      
      public function Command()
      {
         super();
         _modelMap = new Dictionary();
      }
      
      public function get data() : *
      {
         return _data;
      }
      
      public function set data(param1:*) : void
      {
         _data = param1;
      }
      
      public function dispose() : void
      {
         _targetModel = null;
      }
      
      public function execute() : void
      {
      }
      
      public function get targetModel() : Model
      {
         return _targetModel;
      }
      
      public function set targetModel(param1:*) : void
      {
         _targetModel = param1;
      }
      
      public function get cmd() : *
      {
         return _cmd;
      }
      
      public function set cmd(param1:*) : void
      {
         _cmd = param1;
      }
   }
}
