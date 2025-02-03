{
  diagnostics = {
    severity_sort = true;

    float = {
      focusable = false;
      style = "minimal";
      border = "rounded";
      source = "always";
      header = "";
      prefix = "";
    };

    jump = {
      severity.__raw = "vim.diagnostic.severity.WARN";
    };

    signs = {
      text = {
        "__rawKey__vim.diagnostic.severity.ERROR" = "";
        "__rawKey__vim.diagnostic.severity.WARN" = "";
        "__rawKey__vim.diagnostic.severity.HINT" = "󰌵";
        "__rawKey__vim.diagnostic.severity.INFO" = "";
      };
      texthl = {
        "__rawKey__vim.diagnostic.severity.ERROR" = "DiagnosticError";
        "__rawKey__vim.diagnostic.severity.WARN" = "DiagnosticWarn";
        "__rawKey__vim.diagnostic.severity.HINT" = "DiagnosticHint";
        "__rawKey__vim.diagnostic.severity.INFO" = "DiagnosticInfo";
      };
    };

  };
}
