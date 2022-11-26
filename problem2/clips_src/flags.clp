(deftemplate flag
  (slot country)
  (multislot colors)
)

(deffacts flags
    (flag
        (country Egypt)
        (colors red white black)
    )
    (flag
        (country "United States")
        (colors red white blue)
    )
    (flag
        (country Belgium)
        (colors black yellow red)
    )
    (flag
        (country Sweden)
        (colors yellow blue)
    )
    (flag
        (country Italy)
        (colors green white red)
    )
    (flag
        (country Ireland)
        (colors green white orange)
    )
    (flag
        (country Greece)
        (colors blue white)
    )
)
