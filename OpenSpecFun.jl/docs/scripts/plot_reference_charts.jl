using OpenSpecFun

const OUTPUT_DIR = joinpath(@__DIR__, "..", "src", "assets")

function svg_escape(text::AbstractString)
    replace(text, "&" => "&amp;", "<" => "&lt;", ">" => "&gt;")
end

function project_point(x, y, bounds, width, height, padding)
    xmin, xmax, ymin, ymax = bounds
    px = padding + (x - xmin) / (xmax - xmin) * (width - 2padding)
    py = height - padding - (y - ymin) / (ymax - ymin) * (height - 2padding)
    return px, py
end

function polyline_path(xs, ys, bounds, width, height, padding)
    io = IOBuffer()
    for (index, (x, y)) in enumerate(zip(xs, ys))
        px, py = project_point(x, y, bounds, width, height, padding)
        if index == 1
            print(io, "M $(round(px; digits=2)) $(round(py; digits=2))")
        else
            print(io, " L $(round(px; digits=2)) $(round(py; digits=2))")
        end
    end
    return String(take!(io))
end

function axis_line(bounds, width, height, padding, axis::Symbol)
    xmin, xmax, ymin, ymax = bounds
    if axis == :x && ymin <= 0.0 <= ymax
        _, y = project_point(0.0, 0.0, bounds, width, height, padding)
        return "<line x1=\"$(padding)\" y1=\"$(round(y; digits=2))\" x2=\"$(width - padding)\" y2=\"$(round(y; digits=2))\" stroke=\"#808080\" stroke-width=\"1\"/>"
    elseif axis == :y && xmin <= 0.0 <= xmax
        x, _ = project_point(0.0, 0.0, bounds, width, height, padding)
        return "<line x1=\"$(round(x; digits=2))\" y1=\"$(padding)\" x2=\"$(round(x; digits=2))\" y2=\"$(height - padding)\" stroke=\"#808080\" stroke-width=\"1\"/>"
    end
    return ""
end

function write_svg(path, title, xs, ys; color="#1d4ed8")
    width = 960
    height = 360
    padding = 48
    ymin = minimum(ys)
    ymax = maximum(ys)
    if ymin == ymax
        ymin -= 1.0
        ymax += 1.0
    end
    ypad = 0.05 * max(abs(ymin), abs(ymax), 1.0)
    bounds = (minimum(xs), maximum(xs), ymin - ypad, ymax + ypad)
    path_data = polyline_path(xs, ys, bounds, width, height, padding)
    open(path, "w") do io
        println(io, "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 $width $height\" role=\"img\" aria-label=\"$(svg_escape(title))\">")
        println(io, "<rect width=\"100%\" height=\"100%\" fill=\"white\"/>")
        println(io, "<text x=\"$padding\" y=\"28\" font-family=\"system-ui, sans-serif\" font-size=\"20\" fill=\"#111827\">$(svg_escape(title))</text>")
        axis_x = axis_line(bounds, width, height, padding, :x)
        axis_y = axis_line(bounds, width, height, padding, :y)
        if !isempty(axis_x)
            println(io, axis_x)
        end
        if !isempty(axis_y)
            println(io, axis_y)
        end
        println(io, "<path d=\"$path_data\" fill=\"none\" stroke=\"$color\" stroke-width=\"2.5\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>")
        println(io, "</svg>")
    end
end

function airy_ai(x)
    air, _, _, _ = zairy(x, 0.0, 0, 1)
    return air
end

function airy_aip(x)
    air, _, _, _ = zairy(x, 0.0, 1, 1)
    return air
end

function main()
    mkpath(OUTPUT_DIR)

    xs = collect(range(-3.5, 3.5; length=401))
    airy_values = [airy_ai(x) for x in xs]
    airy_derivative_values = [airy_aip(x) for x in xs]
    dawson_values = [OpenSpecFun._dawson_real(x) for x in xs]

    write_svg(joinpath(OUTPUT_DIR, "airy_ai.svg"), "Airy Ai(x)", xs, airy_values)
    write_svg(joinpath(OUTPUT_DIR, "airy_aip.svg"), "Airy Ai'(x)", xs, airy_derivative_values, color="#b45309")
    write_svg(joinpath(OUTPUT_DIR, "dawson.svg"), "Dawson integral F(x)", xs, dawson_values, color="#047857")
end

main()